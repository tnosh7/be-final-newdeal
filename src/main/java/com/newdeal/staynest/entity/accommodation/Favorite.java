package com.newdeal.staynest.entity.accommodation;


import com.newdeal.staynest.entity.Guest;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "favorite")
@Getter
@Setter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long fav_id;

    @ManyToOne
    @JoinColumn(name = "accom_id", nullable = false)
    private Accommodation accommodation;

    @ManyToOne
    @JoinColumn(name = "guest_id", nullable = false)
    private Guest guest;
}
